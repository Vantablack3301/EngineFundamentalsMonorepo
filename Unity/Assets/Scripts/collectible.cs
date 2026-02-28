using UnityEngine;

public class collectible : MonoBehaviour
{
    public GameObject rotObj;
    public BoxCollider collider;

    public float rotationSpeed = 5.0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        rotObj.transform.Rotate(rotObj.transform.rotation.x, Time.deltaTime * rotationSpeed, rotObj.transform.rotation.z);
    }

    private void OnTriggerEnter(Collider collider)
    {
        if (collider.tag == "Player")
        {
            Debug.Log("Collected!");

            collider.GetComponent<AOTADev.PlayerController>().IncrementTreeCount();

            Destroy(gameObject);
        }
    }
}
