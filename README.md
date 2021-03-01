![Scriptdrop](https://cdn.filepicker.io/api/file/DcyeWRHZTRSIKVeIXJ3l)

# What was the hardest part of the implementation?
## This is an excellent question!

The fact that I was dedicated 100% to OOP languages in the past years, even though I had understood the paradigms of a functional language, 
my brain was so used to OOP that it was difficult to find solutions some times, and even when I found them, I dont have doubts that I did not 
take 100% advantage of Elixir's capabilities. This situation made me go back in time and relive the time when I was migrating from DeskTop 
Development to Web Development. Being more specific, the biggest difficulty I faced was working with lists made up of Maps, Tuples or Structs 
and also getting the most out of the Ecto Framework. I knew the concepts but was hard to apply them.
Even the Business part of the application was very clear to me since the first glance in the requirements document, many times I felt like a 
Junior trying to implement something simple and failing. As the days went by this was easing as expected.
 
# What would be your next couple of tasks if you had more time?
## Even taking some risks extending what was asked for, I accomplished the Challenge!, but I still thinking that I have a lot to improve in the app!

- [ ] Use best practices to hide sensitive data, like secret keys from external APIs

- [ ] Develop a more user friendly Interface using Phoenix LiveView, Sockets or even VueJs

- [ ] Add Some filters availability to facilitate users life

- [ ] Improve the Order Workflow and Status Management. There are some gaps that need to be addressed

- [ ] UI Data Formatting

- [ ] More application security to prevent attacks

- [ ] The home page, that is the control panel of pharmacies and couriers must be refactored.   I am using an “IF” that I did not like, but to change this I would need more time to study Phoenix so I deceided dont for now

- [ ] The system's administrative area should be rethought, but this would take a long time, so I looked for a solution that could show my skills and also solve the problem.

- [ ] Solve a simple Bug that a left. I couldn't get the current local date, only UTC, this was frustrating, because I left it for fine-tuning thinking it would be commonplace, but it is not.

- [ ] Replace Comboboxes to AutoComplete and enable in-line registration of customers, addresses, drugs, etc. For sure using LiveView or Sockets

- [ ] Create a new entity in the database to track Orders (Business Workflow)

- [ ] Make Order feature more real, including fields like: Order Date, etc 

- [ ] I think I did not put unique keys in some necessary places, I would like to double check Everything

- [ ] Change a bit the application  “phoenix contexts design patterns”, I don't think I made the best decisions in terms of clarity, but still pretty decent.

- [ ] Use more Elixir Pattern Match

- [ ] Change a filed name in the Table Users (it can be confusing) change 'provider' to 'login_provider'

- [ ] I have to improve the test coverage

- [x] Improve a bit the functionality the able User to enter a list of items that compose an Order. What we have right now, basicly shows the concept. But it is pretty much well done.

- [x] Using Socket to Change Order Status, I left a simple combo box, which can break down the business workflow.

- [x] UI validation (message to the user)


# How could we change the project to be more interesting?
## For sure this Challange was well desing!

In fact, this project is very interesting, because I think it was designed in a way that a Junior programmer has the sense of exceeding expectations 
while a Senior would see small clues that show that the system is much deeper than it looks.
Technically speaking, and taking into account the nature of the language and framework used, requesting requirements that require recursion would 
further exploit the programmer's skills in respect to Elixir, another requirement that could be requested and would exploit the programmer's skills in 
respect to the Phoenix Framework, it would be something related to the social platform, such as comments and evaluation of delivery or even a chat feature, 
both very simple to do using Phoenix.

![Zen](https://www.srtc.org/wp-content/uploads/2018/12/meditation-class-fremantle1-e1454334609459-1080x587.png)


# Wrapping Up !
## It was Awesome

This experience was very enriching in several aspects, I accepted this challenge with zero knowledge about Elixir / Phoenix and only theory about 
functional languages, the experience on this journey of just 7 days shows that we can learn and perform beyonde expectations if we leave our comfort zone
and challange the fear of the unknow. For several years I have been putting myself in situations like this and I advise everyone to do the same, if you
have the desire to grown in all aspects of your life, you will not regret it. My ability to accept challenges in part is supported by my athleta and 
martial artist backgroud and I always say that the most important in our challenges is the journey and not the destination. 
Happiness is not at the destination, but in the Journey, so enjoy every step taken and live the moment, become the moment! 
I will use the oppotunity to thank you Ben and Even though I am very interested in this position, for several aspects that I loved, now even more because
Elixir / Phoenix, if I am not chosen one, I will still be very happy and thankfull. Today I feel comfortable adding Elixir / Phoenix to my resume without any hesitation
and ready for more challanges.


# System Login
The system uses GitHub for Login. 

I already created 2 GitHub accounts for test both already linked with Pharmacy and Courier

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

# Instalation

* Download and Install Elixir and Phoenix 1.5 and Postgress

* Download App source code from GIT

* Edit Line 5 and 6 of this File: /config/dev.exs (enter your postgres credentials)

* From root directory run:
  1. mix ecto.create
  2. mix run priv/repo/seeds.exs 
  3. mix phx.server

* Open your browser and access: http://localhost:4000