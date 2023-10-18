# Hotel Hub (Final Capstone)

<a id="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [🎬 Representation](#representation)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Hotel Hub (Backend) <a id="about-project"></a>

**Hotel Hub** is a website that offers hotel booking and reservation services for travelers, providing a convenient way to find and book accommodations. You can select available rooms for a graphic list on the home page of the website, or you can just click on the reserve menu item and see the full list of available rooms. You can find the repository for the [front end](https://github.com/ProgramKingAbel/hotel-hub-frontend.git) of this project here.

Backend is implement as API-only. The front end is implemented utilizing the React framework.

-  The backend Rails app is implemented as API-only. The application starts by fetching the `users` method on the backend, if the backend is available then the user will login by making a query to `users/new_session`.

-  The room controller provides an `index` method to get all the data for rooms, and a `show` method to get details about a specific room. The `destroy` method deactivates the room when the user sends a delete query by clicking on delete.

-  The reservation controller also provides `index` methods. Index is used to get a list of all reservations made. 
 
## 🛠 Built With <a id="built-with"></a>

### Tech Stack <a id="tech-stack"></a>

<details>
  <summary>Ruby on Rails</summary>
  <ul>
    <li><a>https://rubyonrails.org/</a></li>   
  </ul>
</details>

<!-- Features -->

### Key Features <a id="key-features"></a>

- **Ability to see the featured rooms on the homepage**
- **The ability to reserve rooms based on selecting the date and room name**
- **The ability to add rooms to the database**
- **The ability to delete rooms**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a id="live-demo"></a>

Live demo for the website [Coming Soon]().

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🎬 Kanban Board <a id="kanban"></a>

Link to the [Kanban Board](https://github.com/ProgramKingAbel/hotel-hub-backend/projects/1)

All 5 authors have been contributing to this project from start to finish.


<!-- GETTING STARTED -->

## 💻 Getting Started <a id="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you need to:

- Install Ruby
- Install Rails
- Install Posgresql
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Setup

Clone this repository to your desired folder:

``` 
  git clone https://github.com/ProgramKingAbel/hotel-hub-backend.git 
```

### Install

Install this project with these commands:

```
  cd hotel-hub
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage
   Remove config/master.key and config/credentials.yml.enc if they exist.
2. Run in the terminal: EDITOR=code rails credentials:edit 
3. Close the editor that opens.
4. This command will create a new master.key and credentials.yml.enc if they do not exist.

## Master-Key

[68120c217045712684824133fc2cf359]

### Install
 
 ```cd hotel-hub-frontend
    npm install
 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage
 
To run the project execute the following command:

``` 
 rails s
```

or

```
./bin/dev
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

###  Tests <a id="run-tests"></a>

To run the tests, execute the following command:

```
rspec ./spec/models
rspec ./spec/requests/api/v1

```
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->
## 👥 Authors <a id="authors"></a>  
 
👤 **Abel Morara**
- GitHub: [@githubhandle](https://github.com/ProgramKingAbel)
- Twitter: [@twitterhandle](https://twitter.com/CeoAbel1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/abel-morara/)
 

👤 **Alex Waweru**
- GitHub: [@githubhandle](https://github.com/AleWaweru)
- Twitter: [@twitterhandle](https://twitter.com/home)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/alewaweru/ 


👤 **Enobong Isong**
- GitHub: [@githubhandle](https://github.com/Enoisong)
- Twitter: [@twitterhandle](https://twitter.com/Enobongmisong)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/enobong-isong/ 


👤 **Peter Dumbar**
- GitHub: [@githubhandle](https://github.com/Peter-Dumbari)
- Twitter: [@twitterhandle](https://twitter.com/PeterDumbari)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/peterdumbari/ 

👤 **Sahalu Aminu**
- GitHub: [@githubhandle](https://github.com/sahlminkok)
- Twitter: [@twitterhandle](https://twitter.com/sahlminkok)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/sahlminkok/ 
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a id="future-features"></a> 
 
- **[Payment Integration into the System]**
- **[Add email confirmation]**
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, as well as feature requests are welcome!

Feel free to check the [issues page](https://github.com/ProgramKingAbel/hotel-hub-frontend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->
## ⭐️ Show your support <a id="support"></a>

If you like this project, kindly leave a comment below and share it with
someone who enjoys coding! or still, give us a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->
## 🙏 Acknowledgments <a id="acknowledgements"></a>
 
-  Thanks to our amazing team members and coding partners for their invaluable contributions and dedication. 
-  The Design reference for the website belongs to [Murat Korkmaz](https://www.behance.net/muratk). You can find the reference [here](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
 
## 📝 License <a id="license"></a> 

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
