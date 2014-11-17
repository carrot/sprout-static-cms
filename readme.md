# sprout-static-cms

A sprout template for creating a static CMS in Roots using Contentful and Bitballoon. Read our [blog post](http://carrot.is/coding/static_cms) for more context.

### Installation

- `npm install sprout -g`
- `sprout add static-cms https://github.com/carrot/sprout-static-cms.git`

### Setup

You should sign up for a Contentful and Netlify account before using this template as you will need an access token for both to complete the template configuration.

How to get a token:

Contentful:

- Log in
- Visit the [Getting Started](https://www.contentful.com/developers/documentation/content-management-api/javascript/#getting-started) section of the Management API documentation.
- Note your API token
- Click on the account name at the top right and select 'Create a New Space'
- Create a new space for your project
- Switch to the new space
- Click on the gear on the top menu to go to Space Settings
- Note your Space ID

Netlify:

- `npm install netlify -g` - Install the [netlify CLI client](https://github.com/netlify/netlify-cli)
- `netlify open` - Trigger the netlify auth flow. Auth with your account.
- `cat ~/.netlify/config` - Print out the netlify config token.

### Options

- **name** (name of template)
- **description** (a short description of the template)
- **contentful_token** (your Contentful account's OAuth access token)
- **space_id** (the ID for the Contentful space associated with this project)
- **netlify_token** (your Netlify account's personal access token)
