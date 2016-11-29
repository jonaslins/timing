using UnityEngine;
using System.Collections;

public class Note : MonoBehaviour {

    Rigidbody2D rb;
    public float speed;

    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    // Use this for initialization
    void Start () {
        rb.velocity = new Vector2(0, -speed);
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
