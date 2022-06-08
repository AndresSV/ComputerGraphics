using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotationOnY : MonoBehaviour
{
    public float ySpeed = 1.0f;
    // Update is called once per frame
    void Update()
    {
        transform.Rotate( 0, ySpeed * Time.deltaTime, 0.0f );
    }
}
