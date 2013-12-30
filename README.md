allershopping-orders-proto
==========================

This site instance uses Jekyll custom plugins. And, as a consequence, the publish flow is a bit different:

- Chechout and work on master branch.
- Commit and push your changes (master branch).
- Run rake on project root (it's important to commit previously).
  - The rake job will automatically checkout gh-pages, build the site (including the custom plugins) and force push on gh-pages branch.

That's it!