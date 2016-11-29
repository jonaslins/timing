using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

    int multiplier = 1;
    int streak = 0;

	// Use this for initialization
	void Start () {
        PlayerPrefs.SetInt("Score", 0);
        UpdateGUI();
    }
	
	// Update is called once per frame
	void Update () {
	
	}

    private void OnTriggerEnter2D(Collider2D collision)
    {
       // Destroy(collision.gameObject);
    }

    public int GetScore()
    {
        return 100 * multiplier;
    }

    public void AddStreak()
    {
        streak++;
        if((streak % 3) == 0)
            multiplier += streak/3;

        UpdateGUI();
    }

    void UpdateGUI()
    {
        PlayerPrefs.SetInt("Streak", streak);
        PlayerPrefs.SetInt("Multiplier", multiplier);
    }

    public void ResetStreak()
    {
        streak = 0;
        multiplier = 1;
        UpdateGUI();
    }
}
