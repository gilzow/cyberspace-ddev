## Steps
1. run `composer create-project --prefer-dist statamic/statamic cyberspace-place-ddev`
2. cd into `cyberspace-place-ddev`
3. run `git init`
4. run `git branch -m main`
5. copy ify.sh into directory
6. run `./ify.sh`
7. run `./utils/ify/platformify`
8. Answer questions, select MariaDB
9. Incorrect [`./.platform/services.yaml`](./.platform/services.yaml) file is created
10. Run ` git add .platform/routes.yaml .platform/services.yaml .platform.app.yaml`
12. git commit & git push
13. Run `platform project:create`
14. Answer questions
15. run `ddev config`
13. Accept all defaults
14. run `ddev get ddev/ddev-platformsh`
15. Answer questions
16. run `ddev start`
17. Site fails to start
18. run `ddev ssh`
19. run `printenv | grep PLATFORM` and notice `PLATFORM_RELATIONSHIPS=ewogfQo=`
20. Look at `./.platform/services.yaml` and notice it is malformed <-- git commits stop here
21. Correct `./.platform/services.yaml` by adding service name
21. Run `ddev stop`
22. Rerun `ddev get ddev/ddev-platformsh`
