const sys = require("sys"),
  exec = require("child_process").exec;

function puts(error, stdout, stderr) {
  sys.puts(stdout);
}

/*
  Arguments passed to the tested index.js write in package.json
*/
test("adds 1 + 2 to equal 3", () => {
  expect(exec("npm run testScript", puts)).toBe(3);
});
