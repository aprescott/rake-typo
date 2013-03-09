require "rake"
require "rubyfish"

module Rake
module Typo
  # Finds the Rake::Task instances in +tasks+ that are most
  # similar to +task_name+ and returns a list of them, ordered
  # by name.
  def self.candidate_tasks(task_name, tasks)
    best_similarity = nil

    distances = tasks.map do |t|
      similarity = RubyFish::DamerauLevenshtein.distance(task_name, t.to_s)

      # start off with the first distance count we find to be the best
      best_similarity ||= similarity

      # seek the lowest we can
      best_similarity = similarity if similarity < best_similarity

      [similarity, t]
    end

    distances.select! { |sim, name| sim == best_similarity }
    distances.sort_by! { |sim, task| task.name }
    distances.map { |sim, task| task }
  end
end
end

module Rake::TaskManager
  alias_method :orig_access, :[]

  # Wrap the `TaskManager#[]` method to capture
  # calls to `#fail` to append possibly misspelled
  # commands.
  def [](*args)
    task_name = args.first
    begin
      orig_access(*args)
    rescue => e
      msg = "#{e}"

      candidates = Rake::Typo.candidate_tasks(task_name, Rake.application.tasks)

      unless candidates.empty?
        msg += "\n\n"
        msg += "Did you mean #{candidates.size == 1 ? "this" : "one of these"}?\n\n"

        candidates.each do |c|
          msg += "\t#{c.name}\n"
        end
      end

      # abort, not fail as in the original, just
      # to have a friendlier message without a
      # stacktrace.
      abort msg
    end
  end
end
