# Description

Sample API to diagram editing using shapes (rectangle and circle)

# Setup

1. bundle install

# Database

1. Install and configure PostgreSQL

2. Copy database config ```cp config/database.yml.sample config/database.yml```

3. Prepare database ```rake db:setup && rake db:seed```

# Run

1. Run rails server, eg. ```rails s```


# JSON details

## Diagram

```json
{
  "id": 1,
  "name": "white-board",
  "shapes": [
    ...
  ]
}
```

## Shape

### Rectangle

```json
{
  "shape": {
    "label": "purple-rect",
    "kind": "rectangle",
    "properties" : {
      "width": 15,
      "heigth": 10,
      "center_x": 0,
      "center_y": 0,
      "color": "purple"
    }
  }
}
```

### Circle

```json
{
  "shape": {
    "label": "my-sample-circle",
    "kind": "circle",
    "properties" : {
      "radius": 10,
      "center_x": 0,
      "center_y": 0,
      "color": "white"
    }
  }
}
```

## Sample requests/responses

### create new diagram

POST `/api/v1/1/diagrams`

##### request payload

```json
{
  "diagram": {
    "name": "magnetic-board"
  }
}
```

##### response

```json
{
  "diagram": {
      "id": 1,
      "name": "magnetic-board",
      "shapes": []
  }
}
```

### update diagram

PUT `/api/v1/diagrams/1`

##### request payload

```json
{
  "diagram": {
    "name": "white-magnetic-board"
  }
}
```

##### response

```json
{
  "diagram": {
    "id": 1,
    "name": "white-magnetic-board",
    "shapes": []
  }
}
```

### delete diagram

PUT `/api/v1/diagrams/1`

##### response

```json
{}
```

### add shape to diagram

POST `/api/v1/diagrams/1/shapes`

##### request payload

```json
{
  "shape": {
    "label": "purple-square",
    "kind": "rectangle",
    "properties" : {
      "width": 10,
      "heigth": 10,
      "color": "purple"
    }
  }
}
```

##### response

```json
{
  "shape": {
    "id": 1,
    "label": "purple-square",
    "kind": "rectangle",
    "properties": {
        "color": "purple",
        "width": 10,
        "heigth": 10
    }
  }
}
```

### update shape on diagram

PUT `/api/v1/diagrams/1/shapes/1`

##### request payload

```json
{
  "shape": {
    "label": "purple-square-big",
    "properties" : {
      "width": 100,
      "heigth": 100
    }
  }
}
```

##### response

```json
{
  "shape": {
    "id": 1,
    "label": "purple-square-big",
    "kind": "circle",
    "properties": {
        "width": 100,
        "heigth": 100
    }
  }
}
```

### delete shape from diagram

DELETE `/api/v1/diagrams/1/shapes/1`

##### response

```json
{}
```
