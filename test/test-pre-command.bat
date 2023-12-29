#!/usr/bin/env bats

setup() {
    # 创建一个临时的测试环境
    TEST_DIR=$(mktemp -d)
    mkdir -p "$TEST_DIR/.buildkite"

    # 创建测试用的 user-stories.yml 文件
    cat <<EOF > "$TEST_DIR/.buildkite/user-stories.yml"
user-stories:
- As: some_user_1
  I want: do_something_1
  so that: achieve_some_goal_1
- As: some_user_2
  I want: do_something_2
  so that: achieve_some_goal_2
- As: some_user_3
  I want: do_something_3
  so that: achieve_some_goal_3
EOF

    # 设置环境变量以模拟 Buildkite 环境
    export BUILDKITE_PLUGIN_USER_STORY_VALIDATION_PLUGIN_MAPPING_FILE="$TEST_DIR/.buildkite/user-stories.yml"
}

teardown() {
    # 清理测试环境
    rm -rf "$TEST_DIR"
}

@test "Test pre-command hook with user-stories.yml" {
    # 模拟 pre-command 钩子的执行
    run bash "$BATS_TEST_DIRNAME/../hooks/pre-command"

    # 检查是否成功执行
    assert_success

    # 检查是否输出了正确的 user stories
    assert_output --partial "As: some_user_1"
    assert_output --partial "I want: do_something_1"
    assert_output --partial "so that: achieve_some_goal_1"
    assert_output --partial "As: some_user_2"
    assert_output --partial "I want: do_something_2"
    assert_output --partial "so that: achieve_some_goal_2"
    assert_output --partial "As: some_user_3"
    assert_output --partial "I want: do_something_3"
    assert_output --partial "so that: achieve_some_goal_3"
}
