### Setup

To get this repo set up properly you can run:  
```ruby
bundle 
rake reset # will build database for you with schema
```

### Mnemonic
Given: _______ (What data does the test need?)  
When: _______ (What action is taking place?)  
Then: _______ (What behavior do we need to specify?)  


### Breaking Problem Down In English:

First step is to figure out what you are trying to test in English.  What are
the different components you will need?  

*  Will a user need to be signed in?  
*  If so does that user need to be created?  
*  What objects need to be created?  
*  What page needs to be visited to test functionality?  
*  Will data need to be entered into a form?  
*  What buttons need to be clicked on and tested on the page?  
*  What information should be created when the button/form is clicked?  
*  How do you know if the test passes?  
*  Do I need to namespace my expectations? I.E. should it only say ____ within a
    certain div?  

### Examples:

1.  Visiting 'About' page shows description of our website.  

**Given:**  
**When:**  
**Then:**  

2.  Signing in a user.  

**Given:**  
**When:**  
**Then:**  

3.  Creating a new status message.    

**Given:**  
**When:**  
**Then:**  

### Tips
*  Capybara searches for form itmes by DOM ID, form name, or the text of the
    associated label.  
*  Use the `within 'css-selector' do` block to namespace text content
    expectations  
*  Choose your test data/variables names wisely and semantically in order to
    help you debug quicker later on.  
*  Write your tests to describe your code's behavior, not it's implementation.
    Decouple the implementation from the behavior.  
*  What `let` blocks are doing behind the scenes:

```ruby
let(:user) { User.new(name: "Spencer")

# converts to this:
# memoized accessor method of what was inside the block to let

def user
  @user ||= User.new(name: "Spencer")
end
```

### Refactoring:
Once you have your tests and they're passing you can then refactor your code.
One step most people forget is that your tests are code too and they should be
refactored.  For example, Noel Rappin, in _Rails 4 Test Perscriptions_ argues
that you should generally be expecting for a DOM ID instead of just some generic
content.  Here is an example of how you could refactor:

```ruby
scenario "it creates post" do
  visit '/dashboard'

  expect(page).to have_content("Projects")
end
```

Could be refactored to:

```ruby
scenario "it creates post" do
  visit '/dashboard'

  expect(page).to have_selector("h2#projects")
end
```

This is more insulated from surface changes of text.  

Sometimes it can be hard to predict what the feature/view will look like before
its implemented.  This is why it's important to go through this refactoring
stage.  First you can write loose tests that are more generic and then once you
have a better idea and more information from building the feature you can
refactor to be more specific.  

There is a happy medium though.  You don't want your tests to be so dependent on
the markup that every change you make breaks everything.  After writing more
tests your experience/judgement will guide you in when it's important to be more
specific/less specific.  




