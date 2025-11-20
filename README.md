# Introduction to `at2`

### Motive
Currently, when creative-tech receives a new ticket that requires debugging code, the following steps are usually taken:

1) Create a blank template project for the necessary device runtime.
2) Implement Rive library and initialization code.
3) Bring in the `.riv` file and hook it into the project.

If multiplatform triaging is required, this process must be repeated multiple times.

This is inefficient.

### Solution

With `at2`, the process is much more time-efficient:

1) `at2 workspace my-workspace`
2) `cd ~/at2/my-workspace`
3) `cp [my-file.riv] input.riv`
4) `at2 clone`

This populates a `working` directory with all platform templates and injects the `.riv` file for each project, all of which are ready to use for testing immediately.

# Usage

* `at2 clone <PLATFORM, ...>`: clones the local `template` directories to the local `working` directory. Can specify a `-d <WORKING>` and `-t <TEMPLATE>`.
* `at2 inject <PLATFORM, ...>`: clones the local `input.riv` to the local `working` directories. Can specify `-i <INPUT>`.
* `at2 clear <PLATFORM, ...>`: deletes the local `working` directories.
* `at2 workspace <NAME>`: creates a new global workspace at `~/at2` and clones the global `template` directories at `~/at2/.template`.