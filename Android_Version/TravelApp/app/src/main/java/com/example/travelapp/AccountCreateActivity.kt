package com.example.travelapp

import android.content.ContentValues.TAG
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.google.firebase.auth.FirebaseAuth

class AccountCreateActivity : AppCompatActivity() {

    private lateinit var auth: FirebaseAuth
    lateinit var registerButton: Button
    lateinit var emailData: EditText
    lateinit var passwordData: EditText
    lateinit var loginButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val auth: FirebaseAuth = FirebaseAuth.getInstance()
        //enableEdgeToEdge()
        setContentView(R.layout.activity_account_create)
        emailData = findViewById(R.id.register_email_field)
        passwordData = findViewById(R.id.register_password_field)
        registerButton = findViewById(R.id.register_button)
        loginButton = findViewById(R.id.to_login_button)
        registerButton.setOnClickListener {
            auth.createUserWithEmailAndPassword(emailData.text.toString(), passwordData.text.toString())
                .addOnCompleteListener(this) { task ->
                    if (task.isSuccessful) {
                        // Sign in success, update UI with the signed-in user's information
                        Log.d(TAG, "createUserWithEmail:success")
                        val user = auth.currentUser
                        val intent = Intent(this, PlacesActivity::class.java)
                        startActivity(intent)
                    } else {
                        // If sign in fails, display a message to the user.
                        Log.w(TAG, "createUserWithEmail:failure", task.exception)
                        Toast.makeText(
                            baseContext,
                            "Authentication failed.",
                            Toast.LENGTH_SHORT,
                        ).show()
                    }
                }
        }
        loginButton.setOnClickListener{
            val i = Intent(applicationContext, MainActivity::class.java)
            startActivity(i)
        }


    }
}