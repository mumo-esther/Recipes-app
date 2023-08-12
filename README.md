# Recipe App

In this project, you will start building a Recipe app that keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe.

# 📗 Table of Contents

- [Recipe App](#recipe-app)
  - [Getting Started](#getting-started)
- [📗 Table of Contents](#-table-of-contents)
- [📖 recipe-app](#recipe-app)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👤 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


# 📖 recipe-app <a name="about-project"></a>

The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby</summary>
  <ul>
    <li><a href="https://www.rubyguides.com">Ruby</a></li>
    <li><a href="https://www.postgresql.org/">Postgresql</a></li>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Database schema for the recipe app**
- **Model Classes for the current schema**
- **Unit Tests to test the current functionality**
- **Display a list of recipes and their users**
- **Display the details about a recipe**
- **Allows recipe owners to manage their recipes**

<p align="right">(<a href="#readme-top"></a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

1. A terminal or command propmt
2. Ruby installed on your machine
3. Text editor or your choice (VSCode, Sublime, Atom, etc.)
4. Install Rails gem
5. postgresql


### Setup

Clone this repository to your desired folder:

```sh
  cd your-desired-folder
  git clone git@github.com:veronica365/recipe-app.git
  cd recipe-app
```

### Install

Install this project with:
```sh
  bundle install
```

create database in your postgresql with:
```sh
  rails db:create
```

Run migration with:
```sh
  rails db:migrate
```

Run test to see routes with:
```sh
  rails routes -g #pattern of route to see ie: users
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command: Install through : gem install rspec

```sh
  rspec
```

<p align="right">(<a href="#readme-top"></a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Williams Serubiri**

- GitHub: [@veronica365](https://github.com/veronica365)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/william-sserubiri-veronica/)

👤 **Esther Mawioo**

- [Github](https://github.com/mumo-esther/mumo-esther)
- [Linkedin](https://www.linkedin.com/in/esther-mawioo-58b636225/)

<p align="right">(<a href="#readme-top"></a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Deploy app to staging**

<p align="right">(<a href="#readme-top"></a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/veronica365/recipe-app/issues).

<p align="right">(<a href="#readme-top"></a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project, please give it a ⭐️!

<p align="right">(<a href="#readme-top"></a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank, the Microverse program for giving me this opportunity to learn and build this project.

<p align="right">(<a href="#readme-top"></a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top"></a>)</p>
