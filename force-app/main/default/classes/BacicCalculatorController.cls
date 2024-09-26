public class BacicCalculatorController 
{
    public integer FirstNumber{get;set;}
    public integer SecondNumber{get;set;}
    public integer Result{get;set;}
    public void Addition()
    {
        Result = FirstNumber + SecondNumber;
    }
    public void Subtraction()
    {
        Result = FirstNumber - SecondNumber;
    }
    public void Multiplication()
    {
        Result = FirstNumber * SecondNumber;
    }
    public void Division()
    {
        Result = FirstNumber / SecondNumber;
    }
    public void Modulus()
    {
        Result = Math.Mod(FirstNumber , SecondNumber);
    }
}