# 🚀 Product Management - Java Servlet CRUD Application

> A foundational CRUD (Create, Read, Update, Delete) web application built with a classic Java EE technology stack. This project serves as a practical example of a layered architecture, demonstrating how to separate concerns in a dynamic, database-driven web application.

---

## ✨ Features

- **📋 List Products:** View all products from the database
- **➕ Add New Product:** A dedicated form to create and save new products
- **✏️ Update Product:** Edit the details of any existing product
- **🗑️ Delete Product:** Remove a product from the database with a confirmation step
- **🔍 Keyword Search:** Filter the product list by name

---

## 🛠️ Technology Stack

### Backend
- Java 8
- Java Servlets 4.0
- JavaServer Pages (JSP) 2.3 & JSTL 1.2

### Database & Persistence
- MySQL 8
- JPA (Java Persistence API) 2.1
- Hibernate 5.6 (as the JPA implementation)

### Frontend
- Bootstrap 5 (via CDN for styling)
- HTML5

### Build & Deployment
- Apache Maven
- Apache Tomcat 9

---

## 📋 Prerequisites

To run this project, you will need the following installed on your local machine:

- **Java Development Kit (JDK) 8** or higher
- **Apache Maven**
- **MySQL Server**
- An IDE like **Eclipse for Enterprise Java** or **IntelliJ IDEA Ultimate**

---

## 🚀 Getting Started

Follow these steps to get a local copy of the project up and running.

### 1️⃣ Clone the Repository

First, clone the repository to your local machine.

```bash
git clone https://github.com/your-username/java-servlet-crud-app.git
cd java-servlet-crud-app
```

> **Note:** Remember to replace `your-username` with your actual GitHub username.

---

### 2️⃣ Set Up the Database

1. Log in to your MySQL server (e.g., via MySQL Workbench)
2. Create the database schema for the application

```sql
CREATE DATABASE gestion_produits;
```

> **✅ Important:** You do not need to create any tables. Hibernate is configured to automatically generate the `Product` table when the application starts for the first time.

---

### 3️⃣ Configure the Database Connection

1. Open the project in your IDE
2. Navigate to the persistence configuration file located at:
   ```
   src/main/resources/META-INF/persistence.xml
   ```
3. Update the database user and password properties to match your local MySQL credentials

```xml
<!-- Database Connection Details -->
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/gestion_produits" />
<property name="javax.persistence.jdbc.user" value="root" />
<property name="javax.persistence.jdbc.password" value="your_password_here" />
```

---

### 4️⃣ Run the Application

1. Configure an **Apache Tomcat 9** server in your IDE
2. Add the `product-crud-app` project to the server
3. Start the server
4. Open your web browser and navigate to the application's homepage:

```
http://localhost:8080/product-crud-app/
```

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-username/java-servlet-crud-app/issues).

---

## 👤 Author

**Mohamed Yassine Ben Said**

- GitHub: [@YassineBenSaid329](https://github.com/YassineBenSaid329)

---

<div align="center">
  <strong>⭐ Star this repository if you find it helpful! ⭐</strong>
</div>