# Koyal

- UIKit
- CoreData
- A mental health app where users journal their feelings
- Keeps note of emotions as described by the user
- Editable notes shown with a simple user interface
- UITableView with custom cells

### User flow diagram of Koyal App

```mermaid
flowchart LR
  A[Home Screen] --> B{Add Event}
  A[Home Screeen] --> C{View Entire History}
  B --> C[List of Emotions Screen]
  C --> D{Happy}
  C --> E{Angry}
  C --> F{Proud}
  C --> M{Sad}
  C --> N{Disgusted}
  C --> O{Ashamed}
  C --> P{Jealous}
  C --> Q{Contemptuous}
  C --> R{Bored}
  C --> S{Calm}
  M --> G[Writing Screen]
  N --> G
  O --> G
  P --> G
  Q --> G
  R --> G
  S --> G
  D --> G
  E --> G
  F --> G
  G --> H{Done}
  G --> I{I'll write more}
  H --> A
  I --> J[Paragraph Writing Screen]
  J --> K{Done}
  J --> L{Cancel}
  K --> A
  L --> A
```
