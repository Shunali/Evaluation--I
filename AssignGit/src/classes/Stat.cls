public  class Stat {

   Static Integer myInteger = 10;
    public void  myMethod (Integer multiplier) {
        Integer multiplicationResult;
      myInteger=multiplier*myInteger;
        System.debug('Multiplication is '+  myInteger);
    }
}

//Calling the Class Method using Class Name and not using the instance object
//MyStaticClass.myMethod(100);