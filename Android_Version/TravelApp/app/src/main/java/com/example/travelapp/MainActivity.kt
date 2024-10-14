package com.example.travelapp

import android.content.ContentValues.TAG
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.enableEdgeToEdge
import com.google.firebase.FirebaseApp
import com.google.firebase.auth.FirebaseAuth


class MainActivity : ComponentActivity() {

    //private lateinit var auth: FirebaseAuth
    private lateinit var loginButton: Button
    private lateinit var emailText: EditText
    private lateinit var passwordText: EditText


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val auth: FirebaseAuth = FirebaseAuth.getInstance()

        FirebaseApp.initializeApp(this);
        var emailField = findViewById<EditText>(R.id.email_field)
        var passwordField = findViewById<EditText>(R.id.password_field)
        //auth.createUserWithEmailAndPassword(email, password)
        enableEdgeToEdge()
        var loginButton = findViewById<Button>(R.id.LoginButton)
        var registerText = findViewById<TextView>(R.id.createAccount)
        loginButton.setOnClickListener{
            var email = emailField.getText().toString()
            var password = passwordField.getText().toString()
            if(email != "" && password != "") {
                auth.signInWithEmailAndPassword(email, password)
                    .addOnCompleteListener(this) { task ->
                        if (task.isSuccessful) {
                            // Sign in success, update UI with the signed-in user's information
                            Log.d(TAG, "signInWithEmail:success")
                            val user = auth.currentUser
                            val i = Intent(applicationContext, PlacesActivity::class.java)
                            startActivity(i)
                        } else {
                            // If sign in fails, display a message to the user.
                            Log.w(TAG, "signInWithEmail:failure", task.exception)
                            Toast.makeText(
                                baseContext,
                                "Authentication failed.",
                                Toast.LENGTH_SHORT,
                            ).show()
                        }
                    }
            }
            //auth.createUserWithEmailAndPassword(email, password)
        }

        registerText.setOnClickListener(){
            val i = Intent(applicationContext, AccountCreateActivity::class.java)
            startActivity(i)
        }


        }
    }