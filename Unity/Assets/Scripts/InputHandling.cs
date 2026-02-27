using UnityEngine;
using UnityEngine.InputSystem;

public class InputHandling : MonoBehaviour
{
    [SerializeField] public InputSystem_Actions input;
    private bool AttackHeld = false;

    private void Start()
    {
        input.Player.Attack.performed += AttackPressed;
        input.Player.Attack.started += _ => AttackHeld = true;
        input.Player.Attack.canceled += AttackReleased;
    }

    private void OnEnable()
    {
        input = new InputSystem_Actions();
        input.Player.Enable();
    }

    private void OnDisable()
    {
        input.Player.Disable();
    }

    private void Update()
    {
        if (AttackHeld) Debug.Log("Attack Held");

        Vector2 move = input.Player.Move.ReadValue<Vector2>();
        if(move != Vector2.zero)
        {
            transform.position += new Vector3(-move.x, 0, -move.y) * 0.01f;
        }
    }

    private void AttackPressed(InputAction.CallbackContext _) => Debug.Log("attack pressed");

    private void AttackReleased(InputAction.CallbackContext _) => Debug.Log("attack released");
}
