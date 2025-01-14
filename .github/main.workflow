workflow "Run tests" {
  on = "push"
  resolves = ["Test"]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
  env = {
    NODE_ENV = "development"
  }
}

action "Test" {
  needs = "Install"
  uses = "actions/npm@master"
  args = "test"
}
