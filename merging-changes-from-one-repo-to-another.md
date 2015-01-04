Use case: You've cloned a seed project and need to merge some new changes from the original to your clone.

    git --git-dir=../seed_repo/.git \
    format-patch -k -1 --stdout <commit SHA> | \
    git am -3 -k

This command would merge all changes in that commit SHA. It will present you with a standard merge dialog and let you 
resolve any conflicts. Make sure the target repo is without any working changes before starting.

If it goes smoothly, it will auto-commit the changes using the original message.
