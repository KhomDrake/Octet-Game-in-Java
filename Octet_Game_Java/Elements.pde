class Elements
{
  int eletronsLastLayer;
  int eletronsInTotal;
  int perfectLayer[] = new int[] {2, 8, 18, 32, 32, 18, 8};
  String symbol;
  int ionValue;
  int layers[] = new int[7];
  int lastLayerIndex;

  Elements(int eletrons, String sym, int ion)
  {
    this.eletronsInTotal = eletrons + ion;
    this.symbol = sym;
    this.ionValue = ion;
    Layers();
  }

  int LastLayers()
  {
    return eletronsLastLayer;
  }

  int LastLayersIndex()
  {
    return lastLayerIndex;
  }

  void Layers()
  {
    int pos = 0;
    int eletrons = this.eletronsInTotal;
    while (pos < 7)
    {
      if (eletrons - perfectLayer[pos] > 0)
      {
        eletrons -= perfectLayer[pos];
        layers[pos] = perfectLayer[pos];
        pos++;
      } else
      {
        layers[pos] = eletrons;
        eletronsLastLayer = eletrons;
        lastLayerIndex = pos;
        break;
      }
    }
  }

  boolean CombineTwo(Elements canCombine)
  {
    if (LastLayers() + canCombine.LastLayers() == perfectLayer[LastLayersIndex()] 
      || LastLayers() + canCombine.LastLayers() == perfectLayer[canCombine.LastLayersIndex()]
      || LastLayers() - canCombine.LastLayers() == 0 && (LastLayers() + canCombine.LastLayers() == perfectLayer[LastLayersIndex()] 
      || LastLayers() + canCombine.LastLayers() == perfectLayer[canCombine.LastLayersIndex()]))
    {
      //Debug.Log(symbol + "," + canCombine.symbol);
      return true;
    }

    return false;
  }

  boolean CombineThree(Elements canCombineOne, Elements canCombineTwo)
  {
    if (LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[LastLayersIndex()]
      || LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[canCombineOne.LastLayersIndex()]
      || LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[canCombineTwo.LastLayersIndex()]
      || LastLayers() - canCombineOne.LastLayers() - canCombineTwo.LastLayers() == 0 && (LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[LastLayersIndex()] 
      || LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[canCombineOne.LastLayersIndex()] 
      || LastLayers() + canCombineOne.LastLayers() + canCombineTwo.LastLayers() == perfectLayer[canCombineTwo.LastLayersIndex()]))
    {
      //Debug.Log(symbol + "," + canCombineOne.symbol + "," + canCombineTwo.symbol);
      return true;
    }

    return false;
  }

  
}
