# Run step if some files change

I have a feeling that there must be a much easier solution, to this, but could not find it.

How to make sure that a job or a step in a job is only execute if a file changes.
e.g. if the list of dependencies changes.

* We store the files we would like to monitor in a cache provided by GithHub Actions
* We use [hashFiles](https://docs.github.com/en/actions/learn-github-actions/expressions#hashfiles) to generate the key to the hash.

* We have a shell script called `build.sh` that will run some build process if the `already-built.txt` file does NOT exist and we save this file in the GA cache.
* This way once the build process is executed this file is created and it is store in the cache.
* As long as the cache is restored we won't run the build process.
* Once either of the monitored file changes, the hashFiles will create a new hash and so we will have a new key for the cache, but that cache does not exist
* so the `already-built.txt` won't be restored and the build process will run again. (also creating the file again)


TODO: improve this to use `if:`

