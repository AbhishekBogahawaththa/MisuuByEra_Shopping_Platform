# MisuuByEra — Fashion Shopping Platform

## Overview

**MisuuByEra** is a modern full-stack fashion e-commerce web application built with **HTML/CSS**, **Java**, and **MySQL**. It provides a seamless online shopping experience for fashion and clothing, featuring product browsing, shopping cart management, secure user authentication, an admin dashboard for store management, and integrated online payments via **HелаPay**. Designed with a clean and responsive UI, MisuuByEra delivers a complete end-to-end shopping experience for both customers and store administrators.

📄 **For setup instructions, see the [Getting Started](#getting-started) section below**

### Key Features

- **Product Listing & Browsing**: Explore a wide range of fashion items with category filters and search.
- **Shopping Cart**: Add, update, and remove items from the cart with real-time price calculation.
- **User Authentication**: Secure registration and login system for customers and admins.
- **Admin Dashboard**: Manage products, orders, inventory, and customers from a dedicated admin panel.
- **Order Management**: Track and manage customer orders from placement to delivery.
- **Payment Integration**: Secure online payments powered by **HелаPay**.
- **Responsive Design**: Clean and modern UI built with HTML and CSS for all screen sizes.

### Project Objectives

- Build a complete **end-to-end e-commerce platform** from frontend to backend.
- Implement **secure user authentication** with role-based access (customer vs admin).
- Integrate a **real payment gateway (HелаPay)** for processing online transactions.
- Design a **relational database schema** in MySQL to handle products, orders, users, and payments.
- Demonstrate **Java-based backend development** with clean MVC architecture.

---

## Technologies

| Layer | Technology |
|-------|------------|
| Frontend | HTML, CSS, JavaScript |
| Backend | Java (Servlets / JSP) |
| Database | MySQL |
| Payment Gateway | HелаPay |
| Server | Apache Tomcat |

---

## Project Structure

```
MisuuByEra_Shopping_Platform/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── model/
│   │   │   │   ├── User.java                  # User data model
│   │   │   │   ├── Product.java               # Product data model
│   │   │   │   ├── Order.java                 # Order data model
│   │   │   │   ├── CartItem.java              # Cart item model
│   │   │   │   └── Payment.java               # Payment model
│   │   │   ├── dao/
│   │   │   │   ├── UserDAO.java               # User database operations
│   │   │   │   ├── ProductDAO.java            # Product database operations
│   │   │   │   ├── OrderDAO.java              # Order database operations
│   │   │   │   └── PaymentDAO.java            # Payment database operations
│   │   │   ├── controller/
│   │   │   │   ├── LoginServlet.java          # User login handler
│   │   │   │   ├── RegisterServlet.java       # User registration handler
│   │   │   │   ├── ProductServlet.java        # Product listing handler
│   │   │   │   ├── CartServlet.java           # Shopping cart handler
│   │   │   │   ├── OrderServlet.java          # Order management handler
│   │   │   │   ├── PaymentServlet.java        # HелаPay payment handler
│   │   │   │   └── AdminServlet.java          # Admin dashboard handler
│   │   │   └── util/
│   │   │       └── DBConnection.java          # MySQL database connection
│   │   └── webapp/
│   │       ├── pages/
│   │       │   ├── home.jsp                   # Home / landing page
│   │       │   ├── products.jsp               # Product listing page
│   │       │   ├── productDetail.jsp          # Single product detail page
│   │       │   ├── cart.jsp                   # Shopping cart page
│   │       │   ├── checkout.jsp               # Checkout & payment page
│   │       │   ├── orderConfirmation.jsp      # Order confirmation page
│   │       │   ├── login.jsp                  # Login page
│   │       │   ├── register.jsp               # Registration page
│   │       │   ├── userProfile.jsp            # Customer profile page
│   │       │   └── admin/
│   │       │       ├── adminDashboard.jsp     # Admin main dashboard
│   │       │       ├── manageProducts.jsp     # Product CRUD
│   │       │       ├── manageOrders.jsp       # Order management
│   │       │       └── manageUsers.jsp        # User management
│   │       ├── assets/
│   │       │   ├── css/                       # Stylesheets
│   │       │   ├── js/                        # JavaScript files
│   │       │   └── images/                    # Product & UI images
│   │       └── WEB-INF/
│   │           └── web.xml                    # Servlet mappings
├── database/
│   └── misuu_db.sql                           # MySQL database schema & seed data
├── pom.xml                                    # Maven configuration
├── .gitignore
└── README.md                                  # This file
```

---

## System Architecture

The application follows the **MVC (Model-View-Controller)** pattern:

- **Model**: Java classes represent core data entities (`User`, `Product`, `Order`, `Payment`).
- **View**: JSP pages and HTML/CSS render the storefront and admin UI.
- **Controller**: Java Servlets handle HTTP requests, business logic, and database interactions via DAO classes.

### Data Flow

1. **Browse**: Customer visits the storefront and browses products fetched from MySQL via `ProductDAO`.
2. **Cart**: Items are added to the cart and stored in the session via `CartServlet`.
3. **Checkout**: Customer proceeds to checkout, and order details are saved to MySQL via `OrderDAO`.
4. **Payment**: Payment is processed through **HелаPay** via `PaymentServlet` and confirmed in the database.
5. **Admin**: Admin logs in to manage products, view orders, and update inventory via the admin dashboard.

### Example Workflow: Placing an Order

1. Customer logs in via `LoginServlet`, authenticated against the MySQL `users` table.
2. Customer browses products on `products.jsp` and adds items to cart via `CartServlet`.
3. On checkout, order details are submitted to `OrderServlet` which saves the order to MySQL.
4. `PaymentServlet` initiates a HелаPay transaction and confirms payment status.
5. Customer is redirected to `orderConfirmation.jsp` with order details.

---

## Database Schema

```
users           → id, name, email, password, role, created_at
products        → id, name, description, price, category, stock, image_url
orders          → id, user_id, total_amount, status, created_at
order_items     → id, order_id, product_id, quantity, price
cart            → id, user_id, product_id, quantity
payments        → id, order_id, helапay_ref, amount, status, paid_at
```

---

## Getting Started

### Prerequisites

- [Java JDK](https://www.oracle.com/java/technologies/downloads/) 11 or higher
- [Apache Tomcat](https://tomcat.apache.org/) 10+
- [MySQL](https://www.mysql.com/) 8+
- [Maven](https://maven.apache.org/)
- HелаPay merchant account & API credentials

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/AbhishekBogahawaththa/MisuuByEra_Shopping_Platform.git

# 2. Import the database
# Open MySQL and run:
source database/misuu_db.sql

# 3. Configure database connection
# Edit src/main/java/util/DBConnection.java:
String url = "jdbc:mysql://localhost:3306/misuu_db";
String username = "your_mysql_username";
String password = "your_mysql_password";

# 4. Configure HелаPay credentials
# Add your HелаPay merchant ID and API key in the config

# 5. Build the project
mvn clean package

# 6. Deploy to Tomcat
# Copy the generated .war file to Tomcat's webapps/ folder and start Tomcat
```

Open [http://localhost:8080/MisuuByEra](http://localhost:8080/MisuuByEra) in your browser.

---

## Limitations

- **No real-time stock updates**: Inventory is updated on order confirmation only.
- **Basic security**: Passwords are not yet hashed with BCrypt or similar.
- **No email notifications**: Order confirmation emails are not yet implemented.

---

## Future Enhancements

- Implement **password hashing** using BCrypt for secure credential storage.
- Add **email notifications** for order confirmation and shipping updates.
- Introduce **product reviews and ratings** by customers.
- Build a **wishlist feature** for saving favourite products.
- Migrate to a **React frontend** for a more dynamic shopping experience.
- Deploy on a cloud platform such as **AWS** or **Railway**.

---

## Developer

**Bogahawaththa P.B.P.A (Abhishek)**
- GitHub: [@AbhishekBogahawaththa](https://github.com/AbhishekBogahawaththa)

---

## License

This project is developed and maintained by **Abhisheak bogahawaththa** as a personal project.

All rights reserved. Unauthorized copying, distribution, or commercial use of this project is strictly prohibited without prior written permission from the developer.

© 2025 MisuuByEra — Abhishek Bogahawaththa
