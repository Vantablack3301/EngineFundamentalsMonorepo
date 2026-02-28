using UnityEngine;

public class Caller : MonoBehaviour
{

    public Reciever recieverRef;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        Debug.Log("Hello Reciever");

        recieverRef.OnCalled();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
