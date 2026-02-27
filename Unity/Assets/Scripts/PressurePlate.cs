using UnityEngine;

public class PressurePlate : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        Debug.Log(other.tag);
        if (other.tag == "Player")
        {
            Debug.Log("waow, something entered the zone!!! holy fuck batman we might actually have to kill this guy...");
        }
    }
}
