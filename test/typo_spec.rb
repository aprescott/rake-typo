require "test_helper.rb"

describe Rake::Typo do
  subject { Rake::Typo }

  def candidates(task_name, names)
    names.map! do |n|
      d = double("")
      d.stub(:name) { n }
      d
    end

    subject.candidate_tasks(task_name, names)
  end

  describe ".candidate_tasks" do
    it "meets a few basic requirements" do
      c = candidates("food", %w[foo])
      c.size.should == 1
      c.first.name.should == "foo"

      c = candidates("food", %w[foo fodo])
      c.size.should == 2
      c.map { |d| d.name }.sort.should == %w[foo fodo].sort
    end
  end
end