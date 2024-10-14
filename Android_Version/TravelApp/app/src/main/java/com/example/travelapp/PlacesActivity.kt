package com.example.travelapp

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.fragment.app.Fragment
import com.example.travelapp.databinding.ActivityPlacesBinding


class PlacesActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPlacesBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_places)

        binding = ActivityPlacesBinding.inflate(layoutInflater)
        setContentView(binding.root)

        replaceFragment(Journal())

        binding.bottomNavigationView.setOnItemSelectedListener {
            when(it.itemId) {
                R.id.journalOption -> replaceFragment(Journal())
                R.id.cameraOption -> replaceFragment(Photo())
                R.id.adviceOption -> replaceFragment(Profile())

                else -> {

                }
            }
            true
        }
    }

    private fun replaceFragment(fragment: Fragment) {
        val fragmentManager = supportFragmentManager
        val fragmentTransaction = fragmentManager.beginTransaction()
        fragmentTransaction.replace(R.id.frame_layout, fragment)
        fragmentTransaction.commit()
    }
}