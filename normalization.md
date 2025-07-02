<div align="center">
  <br>
  <h1><b>AirBnB Clone</b></h1>
  <strong>...The Airbnb Clone Project Blueprint</strong>
</div>

---

## Table of Contents

- [Table of Contents](#table-of-contents)
  - [Database Specification - AirBnB](#database-specification---airbnb)
    - [Normalized Entity and Attributes](#normalized-entity-and-attributes)
    - [Message](#message)
    - [Message\_Recipient](#message_recipient)
    - [Amenity](#amenity)
    - [Property\_Feature](#property_feature)
    - [Constraints](#constraints)
    - [Message Table](#message-table)
    - [Message\_Recipient](#message_recipient-1)
    - [Property\_Feature](#property_feature-1)


<br />

---


![Preview of app](airbnb_clone_current.png)

**`Fig. AirBnB Entity - Relationship Diagram`**

<br />

---

### Database Specification - AirBnB

<br />

#### Normalized Entity and Attributes

It's expected that users will send messages to multiple recipients. Creating a separate table removes the transitive dependency from the recipient to the sender, thus ensuring better data integrity. Also, as indicated in the requirements, guests should be able to search properties based on features, thus, necessitating Amenity & Property_Feature tables respectively.

---
<br />

#### Message

- **`message_id`**: Primary Key, UUID, Indexed
- **`sender_id`**: Foreign Key, references User(user_id)
- **`message_body`**: TEXT, NOT NULL
- **`sent_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Message_Recipient

- **`message_id`**: Foreign Key, references Message(message_id)
- **`recipient_id`**: Foreign Key, references User(user_id)
- **`received_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Amenity

- **`amenity_id`**: Primary Key, UUID, Indexed
- **`name`**: VARCHAR, UNIQUE, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  

 #### Property_Feature

- **`property_id`**: Foreign Key, references Property(property_id)
- **`amenity_id`**: Foreign Key, references Amenity(amenity_id)
- **`qty`**: INTEGER, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP



<br />

#### Constraints
---

#### Message Table

- **`Foreign key`** constraints on `sender_id` 


#### Message_Recipient

- **`Foreign key`** constraints on each `message_id` and `recipient_id`.
- **`Composite Primary key`** constraints on `message_id` and `recipient_id`.

  

 #### Property_Feature

- **`Foreign key`** constraints on each `property_id` and `amenity_id`.
- **`Composite Primary key`** constraints on `property_id` and `amenity_id`.
