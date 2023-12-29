# User Story Validator Buildkite Plugin
**Derived from James Sammut user story validation plugin**
A plugin for Buildkite to validate user stories in your repository. It assesses and validates user story compliance in codebases.

## Example

Add the following to your `pipeline.yml` to use the User Story Validator plugin:

```yml
steps:
  - command: echo "Validating user stories"
    plugins:
      - git@github.com:YuchenCAO01/trail-user-story-validation-buildkite-plugin.git#v1.0.0:
          userStoriesFile: "path/to/user-stories.yml"
```
## Configuration

### `userStoriesFile` (Required, string)

The file name of your user story, should in yml format.
Example:
```code
user-stories:
- As: some_user_1
  I want: do_something_1
  so that: achieve_some_goal_1
- As: some_user_2
  I want: do_something_2
  so that: achieve_some_goal_2
```

