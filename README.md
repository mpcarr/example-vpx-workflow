# example-vpx-workflow

Alternative approach to scripting in VPX.

Dependencies:

Node (https://nodejs.org/en/)
Grunt (https://gruntjs.com/)

Clone the repository and install the node modules.

    npm i

run

    npm run watch

This will start grunt which will watch for file changes and compile the tablescript.vbs file in the dest folder. (this is what the vpx table reads on launch).

Pros:

Allows you to separate the vpx scripting from the vpx ide. more control over file structure, easier to maintain.
Allows easy source control of tablescript.

Cons:

Occasionally debugging can be challenging as the line the error is on isn't shown by vpx. This is generally limited to vbs sytanx errors though so not really a big deal. Copying the whole script back into vpx and running the table again will show you where the error is.
