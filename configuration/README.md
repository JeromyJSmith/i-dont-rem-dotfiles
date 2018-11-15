# Laptop Configuration

After trying for a while to use Ansible as our configuration management, it has reached a point
where I need to cut my losses and switch over to shell scripts. I've spent too much time fighting
odd errors from my limited understanding of Ansible and running it against localhost, and the whole
point of this was to save time by automation. Shell scripts I have a better understanding of and
know ways to test each piece individually with Docker. This will eventually get merged over into
my dotfiles repo, as it makes the most sense there. This task would be a whole lot easier if Snaps wouldn't cause random reboots/possible kernel panics.

## Organization

All functions are kept in `functions.sh` to consolidate all work and keep root and non-root functions that
make sense together nearby. Functions will be marked with `@root` or `@user`,. Installation can then be conducted
with two scripts, one run as root to setup all inital tools and libraries and the other as user for fine-grained work.

## Usage

Needs both scripts run, so `sudo bash linux-install.sh && post-install.sh`.

## Testing

Run `make build` to generate the Docker image necessary for testing.
Use the Makefile options to run a single function inside a Docker container, `make test-single function=<name>`. Snap is it's own container tool, so it is difficult to test those functions which rely on it. For now, assume the snap to be functioning correctly.
