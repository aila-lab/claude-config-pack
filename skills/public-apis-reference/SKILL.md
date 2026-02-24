---
name: public-apis-reference
description: Search and discover 1500+ free public APIs across 51 categories for integration into projects
metadata:
  tags: api, reference, integration, backend, discovery
---

## When to use

Use this skill when:
- Choosing a third-party API for a project feature
- Looking for free alternatives to paid services
- Planning backend integrations
- Researching available APIs in a specific domain (weather, finance, AI, etc.)
- Building prototypes that need real data sources

## How to use

The full API catalog is at: `~/.claude/skills-repos/public-apis/README.md`

Read the file and search for APIs matching the user's needs. Each API entry has:
- **Name** (with documentation link)
- **Description** (what it does)
- **Auth** (apiKey, OAuth, No, User-Agent)
- **HTTPS** (Yes/No)
- **CORS** (Yes/No/Unknown)

## Categories (51)

Animals, Anime, Anti-Malware, Art & Design, Authentication & Authorization, Blockchain, Books, Business, Calendar, Cloud Storage & File Sharing, Continuous Integration, Cryptocurrency, Currency Exchange, Data Validation, Development, Dictionaries, Documents & Productivity, Email, Entertainment, Environment, Events, Finance, Food & Drink, Games & Comics, Geocoding, Government, Health, Jobs, Machine Learning, Music, News, Open Data, Open Source Projects, Patent, Personality, Phone, Photography, Programming, Science & Math, Security, Shopping, Social, Sports & Fitness, Test Data, Text Analysis, Tracking, Transportation, URL Shorteners, Vehicle, Video, Weather.

## Search Strategy

1. Identify the domain from the user's request
2. Read the relevant category section from the README
3. Filter by: auth requirement (prefer `No` or `apiKey`), HTTPS (`Yes`), CORS (`Yes`)
4. Present top 3-5 options with pros/cons
5. Recommend the best fit based on project requirements
