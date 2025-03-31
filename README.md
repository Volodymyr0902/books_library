<h1>Books library</h1>

<p>This repository contains the source code of a web application which implements MVC architecture pattern.
Thus, as it uses SSR and EJS all the routes may be accessed via browser.</p>

<h3>Techs used:</h3>
<ul>
  <li>Node.js and Express framework</li>
  <li>Typescript</li>
  <li>MySQL</li>
  <li>Environmental variables</li>
  <li>EJS template engine</li>
  <li>Bootstrap</li>
  <li>Basic auth</li>
  <li>Rate limiting with <code>express-rate-limit</code></li>
  <li>Request data validation with <code>express-validator</code></li>
  <li>Files uploading with <code>multer</code></li>
  <li>Task scheduling with <code>node-cron</code></li>
  <li>DB backups with <code>mysqldump</code></li>
</ul>

<p>Besides, throughout the development the app has got a feature which lets append several authors to a new book instead of only one. 
This required the DB migration and the refactoring of relevant controllers and models, so the migration must be executed on the first app setup.</p>

<p>This app has initial database seeding implemented, so all you need is a local MySQL server up and running.</p>

<h3>To run this application locally:</h3>
<ol>
  <li>Ensure Node.js and MySQL are installed on your machine, and a DB server is running.</li>
  <li>Clone the repository.</li>
  <li>Open .env file and provide your own variables.</li>
  <li>Open the root folder in the terminal.</li>
  <li>Run <code>npm install</code> to install all dependencies.</li>
  <li>Run <code>npm run start</code> to start the server immediately or <code>npm run setup</code> to re-transpile .ts files and start the server.</li>
  <li>Open the root folder in another terminal window and run <code>npm run migrate</code> to execute the migration.</li>
  <li>Use <code>/api/v1</code> endpoint to go to the main page or <code>/admin/api/v1</code> to go to the admin page.</li>
</ol>
