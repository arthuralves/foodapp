# FoodApp

A web application for an e-commerce platform selling food items, built with Ruby on Rails. The application integrates with Stripe for payment processing and utilizes webhooks to process orders once payment is approved.

## Table of Contents

- [Features](#features)
  - [Administrative Module](#administrative-module)
    - [Dashboard](#dashboard)
    - [Product Management](#product-management)
    - [Category Management](#category-management)
    - [Order Management](#order-management)
  - [Store/Sales Module](#storesales-module)
    - [Index](#index)
    - [Cart](#cart)
    - [Checkout](#checkout)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Features

### Administrative Module

#### Dashboard

- **Daily Sales Metrics**: View daily metrics of sales values.
- **Sales Graphs**: Visual representations of sales over time.
- **Unprocessed Sales List**: Keep track of sales that have not yet been processed.

#### Product Management

- **Product Registration**: Add products with basic information such as name, description, price, and image.
- **Category Association**: Group and classify products by associating them with categories.
- **Stock Control**: Manage stock quantities and sizes of product offers.
- **Order Relation**: Monitor best-selling products and track what needs to be delivered in each order.

#### Category Management

- **Category Registration**: Add categories with basic information such as name, description, and image.

#### Order Management

- **Order Listings**: Two separate lists for completed and incomplete orders.
- **Order Details**: Each order includes the customer's email, order ID, completion status, and address.
- **Product Association**: Associate products with orders to know which items are sold in each order.

### Store/Sales Module

#### Index

- **Category Listing**: Display categories with active products.
    - **Product Listing**: Show active products within each category.
    - **Product Detail Page**: View detailed information about a product and add it to the cart.

#### Cart

- **Product List**: View list of products and quantities in the cart.
- **Total Value**: Display the total value of the products in the cart.

#### Checkout

- **Stripe Integration**: Integrated with Stripe payment gateway for secure payments.
- **Webhook Processing**: Handle webhooks to generate sales orders once payment is approved.

## Getting Started

### Prerequisites

- **Stripe Account** for payment processing

### Installation

1. **Clone the Repository**

     ```bash
     git clone https://github.com/arthuralves/foodapp.git
     ```

2. **Navigate to the Project Directory**

     ```bash
     cd foodapp
     ```

3. **Install Dependencies**

     ```bash
     bundle install
     ```

4. **Set Up the Database**

     ```bash
     rails db:create
     rails db:migrate
     rails db:seed
     ```

5. **Configure Stripe**

     Set your Stripe API keys in environment variables or in the `.env` file.
     Setup the webhook in your stripe enviroment pointing to `localhost:3000/webhooks`

6. **Start the Server**

     ```bash
     rails server
     ```

7. **Access the Application**

     Open your web browser and navigate to `http://localhost:3000`.

## Usage

- **Admin Access**: Navigate to `http://localhost:3000/admin` to access the administrative dashboard.
- **Shop Products**: Navigate to `http://localhost:3000/` browse products by categories and add them to your cart.
- **Checkout Process**: Proceed to checkout and complete the payment using Stripe.

## License

This project is licensed under the MIT License.

