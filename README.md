# SaaS Project Management App

- This is a Project Management App Build with RubyOnRails, Multi-tenancy, Stripe, Devise & Bootstrap
- Use [Devise](https://github.com/heartcombo/devise) for authentication
- Use [Stripe API](https://docs.stripe.com/api) for accept payment
- Use [Acts As Tenant Gem](https://github.com/ErwinM/acts_as_tenant) for Multi-tenancy
- Use [Active Storage](https://github.com/rails/rails/tree/main/activestorage) for store artifacts
- Use lvh.me for achieve Multi-tenancy in single browser



- ### Features
  1. Create an account with a subdomain or domain for multi-tenancy.
  2. Edit account and account plans.
  3. Add and edit projects.
  4. Add, edit, and delete artifacts and tasks in projects (admin only).
  5. Invite and remove members from projects (admin only).
  6. Project creators are admins, while others are editors with limited access.
  7. Editors can only view their own artifacts and cannot edit or delete them.
  8. Editors cannot invite new members or delete existing members.
  9. Editors cannot delete or edit existing projects.
  10. Editors can only view their assigned tasks and perform operations on them.
  11. Admins can reassign tasks to other members.
  12. Admins can view all tasks in projects.
  13. If you are not a member of project you can't access project & project's info.
  14. Users can edit their profiles and reset their passwords etc.

---
## YouTube demo video link 

 - ### Project's YouTube video link :- https://youtu.be/xpHL7vgkadk
---

#### This Project is part of [Udemy Course "The Complete Ruby on Rails Developer Course"](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/)

---

#### For more info OR suggestion contact me on

- ### My Twitter :- <a href="https://twitter.com/ramgopalsiddh1/"> Twitter/ramgopal </a>

- ### Portfolio :- <a href="https://ramgopal.dev/">ramgopal.dev</a>
---

## Screenshots

#### Home page without Sign up
  <img src="screenshots/1_home_without_signup.png">

#### Sign up Form
  <img src="screenshots/2_signup_form.png">

#### Stripe Payment Logs
  <img src="screenshots/3_stripe_log.png">

#### User edit, reset password & Resend confirmation link
  <img src="screenshots/4_user_edit.png">

#### Accounts Create, Edit & Update operation
  <img src="screenshots/5_account.png">

#### Show all Accounts
  <img src="screenshots/6_account_home.png">

#### Projects Create, Edit operation & Show all projects 
  <img src="screenshots/7_project.png">

#### Show Project 
  <img src="screenshots/8_project_show.png">

#### Members page
  <img src="screenshots/9_members.png">

#### Show Artifacts & Create & Edit operation
  <img src="screenshots/10_artifact.png">

#### Show an Artifact
  <img src="screenshots/11_artifact_show.png">

#### Show Tasks, Create & Edit operation
  <img src="screenshots/12_task.png">

---

Things you may want to cover:

* Rails version: 7.1.3

* Ruby version: ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x86_64-linux]

* [I Follow This Article for Add Bootstrap 5 in Rails 7  ](https://medium.com/@pietropugliesi/javascript-bootstrap-asset-bundling-in-ruby-on-rails-7-3640a220f2ce)

* Use Devise Gem for authentication for more info visit [Devise Gem's Github](https://github.com/heartcombo/devise)

* To Setup this project follow these steps
  1. Get code 
  2. Set up [Stripe API key](https://docs.stripe.com/api)
  3. Run `bundle install` for install all Gem's from Gemfile
  4. Run `rails db:migrate` for run Migrations and create db
  5. Run Server `rails server`
  6. visit [lvh.me:3000](http://lvh.me:3000/users/sign_in)

  Gem & Tech we use in Application
  1. [Acts As Tenant Gem](https://github.com/ErwinM/acts_as_tenant)
  2. [Active Storage](https://github.com/rails/rails/tree/main/activestorage)
  3. bootstrap 5 Gem
  4. devise Gem
  5. [devise bootstrap-view Gem](https://github.com/hisea/devise-bootstrap-views)
  6. [devise invitable Gem](https://github.com/scambra/devise_invitable)
  7. jbuilder Gem
  8. jquery-rails Gem
  9. dartsass-sprockets Gem
  10. stripe gem

