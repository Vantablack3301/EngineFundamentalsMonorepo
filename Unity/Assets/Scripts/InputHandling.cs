using UnityEngine;
using UnityEngine.InputSystem;

public class InputHandling : MonoBehaviour
{
    [SerializeField] public InputSystem_Actions input;
    private bool AttackHeld = false;

    public GameObject cameraRoot;
    public float lookSensitivity = 1f;
    public float minLook = -80f;
    public float maxLook = 80f;

    public float walkSpeed = .5f;

    private float _pitch;

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
            Vector3 momentum = new Vector3(Vector3.forward.x * move.x, 0f, Vector3.forward.y * move.y);
            Vector3 transformedMomentum = momentum.InverseTransformDirection(transform.forward);
            transform.position += transformedMomentum * walkSpeed;
        }

        Vector2 look = input.Player.Look.ReadValue<Vector2>();
        float yaw = look.x * lookSensitivity;
        float pitchDelta = -look.y * lookSensitivity;

        _pitch = Mathf.Clamp(_pitch + pitchDelta, minLook, maxLook);

        transform.Rotate(Vector3.up, yaw, Space.Self);
        cameraRoot.transform.localEulerAngles = new Vector3(_pitch, 0f, 0f);
    }

    private void AttackPressed(InputAction.CallbackContext _) => Debug.Log("attack pressed");

    private void AttackReleased(InputAction.CallbackContext _) => Debug.Log("attack released");
}
