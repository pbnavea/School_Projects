using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Platform_Manager : MonoBehaviour
{
    public float spacing = 0.1f;
    public float scaleOnY = 0.1f;
    public float Range = 1.0f;
    public int M = 10;
    public int N = 10;
    public UI_Manager UIManage;
    GameObject cube;
    public int ColorSelect = 0;
    GameObject[,] platform;
    float[,] nextPosition;
    float[,] currentPosition;
   public bool Simulate = false;
    Color[,] currentColor;
    Color[,] nextColor;

    float random;



    void Start()
    {
        Build_Manager(M, N, spacing);
    }

    // Update is called once per frame
    void Update()
    {
        //KeyCodes
        //turns off simulation
        if (Input.GetKeyDown(KeyCode.T))
        {
            SimStart();
        }

        if (Input.GetKey(KeyCode.W))
        {
            YInc();

        }

        if (Input.GetKey(KeyCode.S))
        {
            Ydec();
        }
        if(Input.GetKeyDown(KeyCode.H)){
            ColorSelect = 0;
        }
        if (Input.GetKeyDown(KeyCode.R))
        {
            ColorSelect = 1;
        }

        if(Input.GetKeyDown(KeyCode.G)){
            ColorSelect = 2;
        }

        if (Input.GetKeyDown(KeyCode.B)){
            ColorSelect = 3;
        }
        if(Input.GetKeyDown(KeyCode.E)){
            ColorSelect = 4;
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            CloseApp();
        }

        if (Simulate)
        {
            if (platform != null)
            {
                for (int a = 0; a < M; a++)
                {
                    for (int b = 0; b < N; b++)
                    {

                        if (Mathf.Abs(platform[a, b].transform.position.y - nextPosition[a, b]) < 0.05f)//checks the distance between the current and next position
                        {
                            random = UnityEngine.Random.Range(-Range, Range);
                            nextPosition[a, b] = random;
                            currentPosition[a, b] = platform[a, b].transform.position.y;

                            nextColor[a, b] = ColorMenu();
                        }

                        // smooth transition the color ...
                        platform[a, b].transform.gameObject.GetComponent<Renderer>().material.color = Color.Lerp(platform[a, b].transform.gameObject.GetComponent<Renderer>().material.color, nextColor[a, b], Time.deltaTime);

                        // smooth transition the position
                        platform[a, b].transform.position = Vector3.Lerp(platform[a, b].transform.position, new Vector3(platform[a, b].transform.position.x, nextPosition[a, b], platform[a, b].transform.position.z), Time.deltaTime);


                    }
                }
            }
        }
    }



    //beginning of functions

    public void Build_Manager(int row, int column, float newspace)
    {
        if(platform!=null){
            for (int i = 0; i < M;i++){
                for (int j = 0; j < N;j++){
                    Destroy(platform[i, j]);
                }
            }
        }

        platform = new GameObject[row, column];
        currentPosition = new float[row, column];
        nextColor = new Color[row, column];
        nextPosition = new float[row, column];



        for (int i = 0; i < row; i++)
        {
            for (int j = 0; j < column; j++)
            {
                GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
                cube.transform.position = new Vector3(i + (i * newspace), 0.0f, j + (j * newspace));
                cube.transform.rotation = Quaternion.identity;
                cube.transform.localScale = new Vector3(1, scaleOnY, 1);
                cube.name = string.Format("Cube-{0}{1}", i, j);

                platform[i, j] = cube;//cube into the platform
                currentPosition[i, j] = platform[i, j].transform.position.y;
                nextPosition[i, j] = cube.transform.position.y;
                nextColor[i, j] = Color.grey;

            }
        }

        M = row;
        N = column;
        spacing = newspace;
    }


    public Color ColorMenu()
    {

        Color nextDrop = new Color();

        switch (ColorSelect)
        {
            case 0://grey
                nextDrop = Random.ColorHSV(0f,0f,0f,0f, 0f, 1);
                break;
            case 1://red
                nextDrop = new Color(Random.Range(0.0f, 1.0f), 0, 0);
                break;
            case 2://green
                nextDrop = new Color(0, Random.Range(0.0f, 1.0f), 0);
                break;
            case 3://blue
                nextDrop = new Color(0, 0, Random.Range(0.0f, 1.0f));
                break;
            case 4://colorful
                nextDrop = new Color(Random.Range(0.0f, 1.0f), Random.Range(0.0f, 1.0f), Random.Range(0.0f, 1.0f));
                break;

            default:
                break;
        }
        return nextDrop;
    }

    public void SimStart()
    {
        Simulate = !Simulate;
    }

    public void YInc()
    {
        Range += 0.5f;
    }

    public void Ydec()
    {
        Range -= 0.5f;

        if (Range < 0f)
        {
            Range = 0f;
        }
    }

    public void CloseApp()
    {
        Application.Quit();
    }
}

