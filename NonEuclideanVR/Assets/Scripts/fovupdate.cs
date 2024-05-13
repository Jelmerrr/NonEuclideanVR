using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class fovupdate : MonoBehaviour
{
    public Transform vrTransform;
    void Start()
    {
        this.gameObject.GetComponent<Camera>().fieldOfView = vrTransform.GetComponent<Camera>().fieldOfView;
    }
}
