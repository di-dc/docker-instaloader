# docker-instaloader

Docker image with `instaloader` in it. See [instaloader/instaloader](https://github.com/instaloader/instaloader) for more info.

Some of this was inspired by [shyd/docker-instagram-scraper](https://github.com/shyd/docker-instagram-scraper), another good option for Instagram archiving.

## Usage

For full Instaloader usage, refer to [their great documentation here](https://instaloader.github.io/index.html).

One of the goals of this docker image is to allow you to pass a list of args and targets to Instaloader.

Create a file with a list of arguments to be passed on to Instaloader -- this can be named anything you want locally, but should be passed to the container as `il_args.txt`. At a minimum, I recommend using the `--login=my_username` and `--sessionfile` arguments. For example, my file currently contains the following:

```
--login=my_username 
--sessionfile=instaloader.sessionfile 
--geotags
--fast-update
```

Create a file with a list of targets to be downloaded -- again, this can be named anything you want locally, but should be passed to the container as `il_targets.txt`. Per [Instaloader's documentation](https://instaloader.github.io/cli-options.html#what-to-download): a "target is a profile, a "#hashtag", @profile (all profiles that profile is following), or if logged in :feed (pictures from your feed), :stories (stories of your followees) or :saved (collection of posts marked as saved)". The targets should be separated by newlines or spaces.

```
user_1
user_2
#hashtag_1
[etc]
```

Then you can run a new container, passing those files to it:

```
docker run --name instaloader -it \
    -v $(pwd)\download:/download 
    -v $(pwd)\docker\il_args.txt:/il_args.txt 
    -v $(pwd)\docker\il_targets.txt:/il_targets.txt 
    instaloader
```

By default, media will be downloaded to `./download/[target]`. The folder/file structure can be modified via Instaloader arguments using `--dirname-pattern` or `--filename-pattern`.

## Disclaimer

This docker image is in no way affiliated with, authorized, maintained or endorsed by Instaloader or by Instagram or any of its affiliates or subsidiaries. This is an independent and unofficial project. Use at your own risk.

There's a decent chance it doesn't enable you to use all Instaloader functionality, though I've done my best.