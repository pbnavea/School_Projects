using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UI_Manager : MonoBehaviour
{
    public RectTransform closepanel;//panel to be removed
    public Dropdown myDropdown;
    public Platform_Manager buildManage;
    public int row;
    public int column;
    public float space;


    // begin functions

    public void TogglePanel(GameObject panel)
    {
        panel.gameObject.SetActive(!panel.gameObject.activeSelf);
    }

    public void QuitClick()
    {
        //quits the application
        buildManage.CloseApp();
        Debug.Log("Application Exit");
    }

    public void Dropdown(Dropdown drop)
    {
        int dropval = drop.value;
        buildManage.ColorSelect = dropval;
    }

    public void SimClick()
    {
        //create a public function first that's attached to a null GameObject
        Debug.Log("you've clicked THE button.");
        buildManage.SimStart();
    }

    public void rowSlider(Slider slide)
    {
        int commonSlide = (int)slide.value;
        row = commonSlide;
    }
    public void columnSlider(Slider slide)
    {
        int commonSlide = (int)slide.value;
        column = commonSlide;
    }

    public void yDisp(Slider slide)
    {
        float commonSlide = slide.value;
        buildManage.Range = commonSlide;
    }
    public void spacer(Slider slide)
    {
        float commonSlide = slide.value;
        space = commonSlide;
    }
    public void buildClick()
    {
        buildManage.Build_Manager(row, column, space);
    }
}
