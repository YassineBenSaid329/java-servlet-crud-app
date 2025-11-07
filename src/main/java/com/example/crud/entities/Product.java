package com.example.crud.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;
    private double prix;
    private int quantite;

    // A no-argument constructor is required by JPA
    public Product() {
        super();
    }

    // A convenience constructor to create new products
    public Product(String nom, double prix, int quantite) {
        super();
        this.nom = nom;
        this.prix = prix;
        this.quantite = quantite;
    }

    // Getters and Setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", nom=" + nom + ", prix=" + prix + ", quantite=" + quantite + "]";
    }
}