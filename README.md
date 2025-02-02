# AirTable Client

## Table of Contents

- [AirTable Client](#AirTable Client)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Authentication](#authentication)
  - [Installation](#installation)
  - [License](#license)

## Introduction

AirTable Client is a library for querying the [AirTable API](https://airtable.com/developers/web/api/introduction).

In order to use the API you will need to create a personal access token via [AirTable](https://airtable.com/create/tokens) and follow the instructions in the [Authentication](#authentication) section.

### Supported Endpoints

#### Bases

- List Bases - Requires: `schema.bases:read`
- List Schemas - Requires: `schema.bases:read`
- ~~Create Base - Requires: `	schema.bases:write`~~

#### Tables

- ~~Update Table - Requires: `schema.bases:write`~~
- ~~Create Table - Requires: `schema.bases:write`~~

#### Comments

- ~~List Comments - Requires: `data.recordComments:read`~~
- ~~Update Comments - Requires: `data.recordComments:write`~~
- ~~Create Comments - Requires: `data.recordComments:write`~~
- ~~Destroy Comments - Requires: `data.recordComments:write`~~

#### Fields

- ~~Update Field - Requires: `schema.bases:write`~~
- ~~Create Field - Requires: `schema.bases:write`~~

#### Records

- List Records - Requires: `data.records:read`
- ~~Get Record - Requires: `data.records:read`~~
- ~~Update Record - Requires: `data.records:write`~~
- ~~Update Records - Requires: `data.records:write`~~
- ~~Create Records - Requires: `data.records:write`~~
- ~~Delete Records - Requires: `data.records:write`~~
- ~~Delete Record - Requires: `data.records:write`~~
- ~~Sync CSV Data - Requires: `data.records:write`, `schema.bases:write`~~
- ~~Upload Attachement - Requires: `data.records:write`~~

### Non-supported Endpoints

#### Webhooks

- List Webhooks - Requires: `webhook:manage`
- List Webhook Payloads - Requires: [https://airtable.com/developers/web/api/webhooks-overview#authorization](Webhook Authorization)
- Create a Webhook - Requires: [https://airtable.com/developers/web/api/webhooks-overview#authorization](Webhook Authorization)
- Destory a Webhook - Requires: `webhook:manage`

#### Enterprise

All Enterprise endpoints are unsupported as of the current version:

- Views
- Permissions
- Org Management
  - Workspaces
  - Enterprises
  - Users
  - User Groups
  - Audit Logs
  - Compliance
  - Extensions
  - SCIM

## Installation

Add it to your Gemfile:

``` ruby
gem 'airtable-client'
```

