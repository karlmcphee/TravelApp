package com.example.travelapp

import android.app.DownloadManager.Query
import android.content.ContentValues.TAG
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import androidx.fragment.app.Fragment
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.ktx.database
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.ktx.Firebase


// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [Photo.newInstance] factory method to
 * create an instance of this fragment.
 */
class Photo : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null
    private lateinit var database: DatabaseReference


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        arguments?.let {
            param1 = it.getString(ARG_PARAM1)
            param2 = it.getString(ARG_PARAM2)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        var view = inflater.inflate(R.layout.fragment_photo, container, false)
        var edit1 = view.findViewById<EditText>(R.id.text22)
        var button1 = view.findViewById<Button>(R.id.button1)
        //Log.d("user", user.toString())

        val auth: FirebaseAuth = FirebaseAuth.getInstance()
        var user = auth.currentUser
        var firestore = FirebaseFirestore.getInstance()
        database = Firebase.database.reference
        val userMap = hashMapOf(
            "uid" to user?.uid,
        )
        button1.setOnClickListener{
            if(edit1.getText().toString() != "") {
                val users = firestore.collection("users")
                users.document(user?.uid ?: "unknown").set(userMap)
                    .addOnSuccessListener { Log.d(TAG, "DocumentSnapshot successfully written!") }
                    .addOnFailureListener { e -> Log.w(TAG, "Error writing document", e) }
            }
        }
        return view
    }
}