public class ProductsPageController{ 
    
    public String clicked{ get; set; }
  
    public ProductsPageController(ApexPages.StandardController Account){
        Account newAcc = new Account();
    }

  public Pagereference clickme1()
  {
    PageReference pageRef1 = new PageReference('/apex/Uranium');
    clicked='Uranium is a chemical element with the symbol U and atomic number 92. It is a silvery-grey metal in the actinide series of the periodic table. A uranium atom has 92 protons and 92 electrons, of which 6 are valence electrons. Uranium is weakly radioactive because all isotopes of uranium are unstable; the half-lives of its naturally occurring isotopes range between 159,200 years and 4.5 billion years. The most common isotopes in natural uranium are uranium-238 (which has 146 neutrons and accounts for over 99% of uranium on Earth) and uranium-235 (which has 143 neutrons). Uranium has the highest atomic weight of the primordially occurring elements. Its density is about 70% higher than that of lead, and slightly lower than that of gold or tungsten. It occurs naturally in low concentrations of a few parts per million in soil, rock and water, and is commercially extracted from uranium-bearing minerals such as uraninite.[3] ';
    
    return pageRef1;
  }

    public Pagereference clickme2()
  {
    PageReference pageRef2 = new PageReference('/apex/Tungsten');
    clicked='Tungsten, or wolfram,[9][10] is a chemical element with the symbol W and atomic number 74. Tungsten is a rare metal found naturally on Earth almost exclusively as compounds with other elements. It was identified as a new element in 1781 and first isolated as a metal in 1783. Its important ores include tungsten, scheelite, and wolframite, the last lending the element its alternate name.';
    
    return pageRef2;
  }
    
    public Pagereference clickme3()
  {
    PageReference pageRef3 = new PageReference('/apex/Platinum');
    clicked='Platinum is a chemical element with the symbol Pt and atomic number 78. It is a dense, malleable, ductile, highly unreactive, precious, silverish-white transition metal. Its name is derived from the Spanish term platino, meaning "little silver".[3][4] ';
    
    return pageRef3;
  }
    
    public Pagereference clickme4()
  {
    PageReference pageRef4 = new PageReference('/apex/ProductsPage');
    clicked='';
    
    return pageRef4;
  }
}