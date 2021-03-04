![Scriptdrop](https://cdn.filepicker.io/api/file/DcyeWRHZTRSIKVeIXJ3l)

# What was the hardest part of the implementation?
## This is an excellent question!

In the past years I was dedicated 100% to OOP languages. Even though I had understood the paradigms of a functional language, my brain was so used to OOP that oftentimes I struggled to find solutions for simple problems. When I found them I’m sure I didn’t take 100% advantage of Elixir’s capabilities. This situation made me go back in time and relive when I was migrating from Desktop Development to Web Development. More specifically, the biggest difficulty I was faced was working with lists made up of Maps, Tuples or Structs and also getting the most out of the Ecto Framework. I knew the concepts but struggled to apply them. The Business part of the application was very clear to me since the first glance in the requirements document, but many times I felt like a Junior trying to implement something simple, oftentimes failing and restarting the cycle. As the days went by, this was easing as expected.

>In order to implement a feature, I had to consider all aspects of a test or challenge, not just coding. I wasn’t just thinking in terms of performance and best practice but also how to show what I can do with Phoenix and Elixir. So yes, there are better ways to implement some features, performance-wise and architecture-wise.
 
# What would be your next couple of tasks if you had more time?
## Even taking some risks extending what was asked for, I accomplished the challenge, but I am still thinking that I have a lot to improve in the app!

- [ ] Use best practices to hide sensitive data like secret keys from external APIs

- [ ] Develop a more user friendly Interface using Phoenix LiveView, Sockets or even VueJs/ReactJs

- [ ] Add Some filter feature in some pages to facilitate users life

- [ ] Improve the Order Workflow and Status Management. There are some gaps that need to be addressed

- [ ] UI Data Formatting

- [ ] Improve Server Call in View Pages (remove IFs)

- [ ] More application security to prevent attacks

- [ ] The home page that is the 'control panel' of pharmacies and couriers must be refactored. I am using an “IF” that I did not like, but to change this I would need more time to study Phoenix so I deceided not to do it for now

- [ ] The system's administrative area should be rethought, but this would take a long time, so I looked for a solution that could show my skills and also solve the problem.

- [ ] Solve a simple Bug that I left. I couldn't get the current local date, only UTC. This was frustrating. because I left it for fine-tuning thinking it would be commonplace, but it is not.

- [ ] Replace Comboboxes to AutoComplete and enable in-line registration of customers, addresses, drugs, etc. For sure using LiveView or Sockets

- [ ] Make Order feature more real, including fields like: Order Date, breaking down field Address to City, State, Street, etc  and create a separated entity in the database to store it.

- [ ] I think I did not put unique keys in some necessary places; I would like to double check everything

- [ ] Change a bit the application “Phoenix Contexts Design Patterns”, I don't think I made the best decisions in terms of clarity, but it's still pretty decent.

- [ ] Use more Elixir Pattern Match

- [ ] Change a field name in the Table Users (it can be confusing) change 'provider' to 'login_provider', also in the table orders the field 'status' was supposed to be 'status_id'

- [ ] I have to improve the test coverage. Also I have some test failing due a big refactoring task I had done. I had to fix it.

- [ ] Ecto usage: Controling Transactios, Creating Triggers using migrations, Load Referenced Tables in the main Schema

- [x] Ecto usage: Foreing Key using Delete Cascade

- [x] Slightly improve the functionality that allows Users to enter a list of items that compose an Order. What I have right now, basicly shows the concept. But it is pretty much well done.

- [x] Using Socket to Change Order Status; I left a simple combo box which can break down the business workflow.

- [x] UI validation (message to the user)

- [x] Create a new entity in the database to track Orders (Business Workflow)


# How could we change the project to be more interesting?
## For sure this challenge was well-designed!

In fact, this project is very interesting, because I think it was designed in a way that a Junior programmer has the sense of exceeding expectations while a Senior would see small clues that show that the system is much deeper than it looks. Technically speaking and taking into account the nature of the language and framework used, requesting something that requires recursion would further exploit the programmer's skills in respect to Elixir Language; another requirement that could be interesting and would exploit the programmer's skills in respect to the Phoenix Framework would be something related to the social platforms, such as comments and delivery evaluation or even a chat feature, both very simple to accomplish using Phoenix.

![Zen](https://www.srtc.org/wp-content/uploads/2018/12/meditation-class-fremantle1-e1454334609459-1080x587.png)


# Wrapping Up !
## It was Awesome

This experience was very enriching in several aspects; I accepted this challenge with zero knowledge about Elixir / Phoenix and only theory about functional languages; the experience on this journey of just 7 days shows that we can learn and perform beyond expectations if we leave our comfort zone challenging the fear of the unknown. For several years I have been putting myself in situations like this, and I recommend everyone to do the same in case you have the drive to grow in all aspects of your life; you will not regret it. Talking a bit about my personal thoughts: my ability to accept challenges in part is supported by my athlete and martial artist background, and I believe that the most important part in our challenges is the journey and not the destination. Happiness is not at the destination, but during the Journey. Enjoy every step and live in the moment; become the moment! I will use the opportunity to thank you, Ben. I am very interested in this position for several aspects that I love about the company and the position itself (now even more because Elixir/Phoenix). If I am not chosen, I will still be very happy and thankful. Today I feel comfortable adding Elixir / Phoenix to my resume without any hesitation and I am ready for more challenges.


# System Login
The system uses GitHub for Login. 

I already created 2 GitHub accounts for testing both already linked with Pharmacy and Courier

* Pharmacy
  - login: scriptdrop.pharmacy@gmail.com
  - password: scriptdrop1!

* Courier
  - login: scriptdrop.delivery@gmail.com
  - password: scriptdrop1!

* If you login in using your own GitHub account
  - Access the menu: Admin Area -> Users
  - Find your GitHub email in the list of Users
  - Click in the Edit icon
  - Select your provider (Pharmacy or Courier)
  - Save

# Database ERD
![ERD](https://i.postimg.cc/QtpySqPT/scriptdropdb2-0.png)


# Installation

* Download and Install Elixir and Phoenix 1.5 and Postgress

* Download App source code from GIT

* Edit Line 5 and 6 of this File: /config/dev.exs (enter your postgres credentials)

* From root directory run:
  1. mix ecto.create
  2. mix run priv/repo/seeds.exs 
  3. mix phx.server

* Open your browser and access: http://localhost:4000

# Up and Runing
### The software is runing at

http://34.123.181.139:4000/