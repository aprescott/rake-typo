# No more task typos

Tired of seeing this and not knowing the exact command name?

```
$ rake ffoo

rake aborted!
Don't know how to build task 'ffoo'
(See full trace by running task with --trace)
```

Add this to your rakefile:

```ruby
require "rake/typo"
```

Now you can get suggestions for similar task names:

```
$ rake ffoo

Don't know how to build task 'food:bar'

Did you mean this?

	foo
```

# Install and use

```bash
$ gem install rake-typo
```

Then simply `require "rake-typo"` to your Rake file.

# License and contributing

Released under the MIT license. See LICENSE for details.

Any contributions will be assumed by default to be under the same terms.

The quickest way to get changes contributed:

1. Visit the [GitHub repository for rake-typo](https://github.com/aprescott/rake-typo).
2. [Fork the repository](https://help.github.com/articles/fork-a-repo).
3. Check out a branch on the latest master for your change: `git checkout -b master new-feature` --- do not make changes on `master`! Make sure that anything added or changed has a test in the `test/` directory. Use the existing files as examples. All tests for new/changed behaviour should pass.
4. [Send a pull request on GitHub](https://help.github.com/articles/fork-a-repo), including a description of what you've changed. (Note: your contribution will be assumed to be under the same terms of the project by default.)
