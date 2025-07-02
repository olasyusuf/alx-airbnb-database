
<div align="center">
  <br>
  <h1><b>Database Specification - AirBnB</b></h1>
</div>
<br />

---
## Table of Contents

- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
  - [Entities and Attributes](#entities-and-attributes)
    - [User](#user)
    - [Property](#property)
    - [Amenity](#amenity)
    - [Property\_Feature](#property_feature)
    - [Booking](#booking)
    - [Payment](#payment)
    - [Review](#review)
    - [Message](#message)
    - [Message\_Recipient](#message_recipient)
  - [Constraints](#constraints)
    - [User Table](#user-table)
    - [Property Table](#property-table)
    - [Amenity Table](#amenity-table)
    - [Property\_Feature Table](#property_feature-table)
    - [Booking Table](#booking-table)
    - [Payment Table](#payment-table)
    - [Review Table](#review-table)
    - [Message Table](#message-table)
    - [Message\_Recipient Table](#message_recipient-table)
  - [Indexing](#indexing)

## Introduction

<br />

### Entities and Attributes
---

#### User

- **`user_id`**: Primary Key, UUID, Indexed
- **`first_name`**: VARCHAR, NOT NULL
- **`last_name`**: VARCHAR, NOT NULL
- **`email`**: VARCHAR, UNIQUE, NOT NULL
- **`password_hash`**: VARCHAR, NOT NULL
- **`phone_number`**: VARCHAR, NULL
- **`role`**: ENUM (guest, host, admin), NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Property

- **`property_id`**: Primary Key, UUID, Indexed
- **`host_id`**: Foreign Key, references User(user_id)
- **`name`**: VARCHAR, NOT NULL
- **`description`**: TEXT, NOT NULL
- **`location`**: VARCHAR, NOT NULL
- **`pricepernight`**: DECIMAL, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **`updated_at`**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP


#### Amenity

- **`amenity_id`**: Primary Key, UUID, Indexed
- **`name`**: VARCHAR, UNIQUE, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  

 #### Property_Feature

- **`property_id`**: Foreign Key, references Property(property_id)
- **`amenity_id`**: Foreign Key, references Amenity(amenity_id)
- **`qty`**: INTEGER, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Booking

- **`booking_id`**: Primary Key, UUID, Indexed
- **`property_id`**: Foreign Key, references Property(property_id)
- **`user_id`**: Foreign Key, references User(user_id)
- **`start_date`**: DATE, NOT NULL
- **`end_date`**: DATE, NOT NULL
- **`total_price`**: DECIMAL, NOT NULL
- **`status`**: ENUM (pending, confirmed, canceled), NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Payment

- **`payment_id`**: Primary Key, UUID, Indexed
- **`booking_id`**: Foreign Key, references Booking(booking_id)
- **`amount`**: DECIMAL, NOT NULL
- **`payment_date`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **`payment_method`**: ENUM (credit_card, paypal, stripe), NOT NULL


#### Review

- **`review_id`**: Primary Key, UUID, Indexed
- **`property_id`**: Foreign Key, references Property(property_id)
- **`user_id`**: Foreign Key, references User(user_id)
- **`rating`**: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- **`comment`**: TEXT, NOT NULL
- **`created_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Message

- **`message_id`**: Primary Key, UUID, Indexed
- **`sender_id`**: Foreign Key, references User(user_id)
- **`message_body`**: TEXT, NOT NULL
- **`sent_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


#### Message_Recipient

- **`message_id`**: Primary Key, UUID, Indexed
- **`recipient_id`**: Foreign Key, references User(user_id)
- **`received_at`**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

<br />


### Constraints
---

#### User Table

- **`Unique`** constraint on `email`.
- **`Non-null`** constraints on required fields.


#### Property Table

- **`Foreign key`** constraint on `host_id`.
- **`Non-null`** constraints on essential attributes.


#### Amenity Table

- **`Unique`** constraint on `name`.
- **`Non-null`** constraints on essential attributes.


#### Property_Feature Table

- **`Primary key`** constraint on `property_id` and `amenity_id`.
- **`Foreign key`** constraint on `property_id` and `amenity_id`.
- **`Non-null`** constraints on essential attributes.


#### Booking Table

- **`Foreign key`** constraints on `property_id` and `user_id`.
- **`status`** must be one of pending, confirmed, or canceled.


#### Payment Table

- **`Foreign key`** constraint on `booking_id`, ensuring `payment` is linked to valid `bookings`.


#### Review Table

- Constraints on **`rating`** values (1-5).
- **`Foreign key`** constraints on `property_id` and `user_id`.


#### Message Table

- **`Foreign key`** constraints on `sender_id`.


#### Message_Recipient Table

- **`Primary key`** constraint on `message_id` and `recipient_id`.
- **`Foreign key`** constraint on `message_id` and `recipient_id`.
- **`Non-null`** constraints on essential attributes.

<br />

---

### Indexing

- **`Primary Keys`**: Indexed automatically.
- **`Additional Indexes`**:
    - **`email`** in the `User` table.
    - **`name`** in the `Amenity` table.
    - **`location`** in the `Property` table.
    - **`amenity_id`** in the `Property_Feature` table.
    - **`property_id`** in the `Property`, `Property_Feature`, and `Booking` tables.
    - **`booking_id`** in the `Booking` and `Payment` tables.

