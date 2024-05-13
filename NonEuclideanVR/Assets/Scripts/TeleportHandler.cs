using Autohand;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TeleportHandler : MonoBehaviour
{
    public bool activeTeleporter;
    public Transform teleportTarget;
    public GameObject playerObject;
    public GameObject container;

    public AutoHandPlayer autohandPlayer;

    private void Start()
    {
    }

    private void OnTriggerEnter(Collider other)
    {
        if (activeTeleporter == true && other.tag == "Player")
        {
                Vector3 newPosition = teleportTarget.transform.position + getRelativePosition(this.transform, playerObject.transform.position);
                autohandPlayer.SetPosition(newPosition);
                //playerObject.transform.position = teleportTarget.transform.position + getRelativePosition(this.transform, playerObject.transform.position);
                //container.transform.position = teleportTarget.transform.position + getRelativePosition(this.transform, container.transform.position);
        }
    }

    public static Vector3 getRelativePosition(Transform origin, Vector3 position)
    {
        Vector3 distance = position - origin.position;
        Vector3 relativePosition = Vector3.zero;
        relativePosition.x = Vector3.Dot(distance, origin.right.normalized);
        relativePosition.y = Vector3.Dot(distance, origin.up.normalized);
        relativePosition.z = Vector3.Dot(distance, origin.forward.normalized);

        return relativePosition;
    }
}
