using UnityEngine;
using System.Collections;

public class Activator : MonoBehaviour {

    public KeyCode key;
    bool active = false;
    Color old;


    SpriteRenderer sr;
    GameObject note, gm;


    private void Awake()
    {
        sr = GetComponent<SpriteRenderer>();
    }

    // Use this for initialization
    void Start () {
        gm = GameObject.Find("GameManager");
        old = sr.color;
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(key))
        {
            StartCoroutine(Pressed());
        }

        if (Input.GetKeyDown(key) && active)
        {
            Destroy(note);
            gm.GetComponent<GameManager>().AddStreak();
            AddScore();
            active = false;
        }else if(Input.GetKeyDown(key) && !active){
            gm.GetComponent<GameManager>().ResetStreak();
        }

    }


    private void OnTriggerEnter2D(Collider2D col)
    {
        active = true;
        if (col.gameObject.tag == "Note") {
            note = col.gameObject;
        }

    }

    private void OnTriggerExit2D(Collider2D col)
    {
        active = false;
        gm.GetComponent<GameManager>().ResetStreak();
    }

    void AddScore()
    {
        int currentScore = PlayerPrefs.GetInt("Score");
        PlayerPrefs.SetInt("Score", currentScore + gm.GetComponent<GameManager>().GetScore());
    }

    IEnumerator Pressed()
    {
        sr.color = Color.gray;
        yield return new WaitForSeconds(0.1f);
        sr.color = old;
    }
}
