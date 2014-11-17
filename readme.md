# sprout-static-cms

A sprout template for creating a static CMS in Roots using Contentful and Netlify.

### Installation

- `npm install sprout -g`
- `sprout add static-cms https://github.com/carrot/sprout-static-cms.git`

### Setup

You should sign up for a Contentful and Netlify account before using this template as you will need an access token for both to complete the template configuration.

You will need the following set up before you run this:

1. A Contentful account and "space"

- Create an account on their [website](https://contentful.com/).
- Click on the top right menu and create a new space for your project (or edit the default one you start with).
- Switch to the space and click on the gear on the top menu to go to Space Settings
- Note your Contentful Space ID, you'll need this for the template

2. A Contentful API token

- Go to your project's space
- Click on 'API' on the top menu bar
- Click on 'API Keys' under the 'Content Delivery API' section on the left hand bar
- Add a new API by clicking 'Add API key' and fill out the form
- Note the Production API Access Token, you'll need this for the template.

3. A Netlify account and API token

- Create an account on their [website](https://www.netlify.com/)
- `npm install netlify -g` - Install the [netlify CLI client](https://github.com/netlify/netlify-cli)
- `netlify open` - Trigger the netlify auth flow. Auth with your account.
- `cat ~/.netlify/config` - Print out the netlify API token.
- Note your Netlify API token, you'll need this for the template.

### Options

- **name** (name of template)
- **description** (a short description of the template)
- **contentful_token** (your Contentful account's Delivery API access token)
- **space_id** (the ID for the Contentful space associated with this project)
- **netlify_token** (your Netlify account's personal access token)
