package damageCalculation
{
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellState;
   
   public interface DamageCalculationInterface
   {
       
      
      function getLinkedExplosionSpellFromFighter(param1:HaxeFighter) : HaxeSpell;
      
      function getBombExplosionSpellFromFighter(param1:HaxeFighter) : HaxeSpell;
      
      function getBombCastOnFighterSpell(param1:int, param2:int) : HaxeSpell;
      
      function createStateFromId(param1:uint) : HaxeSpellState;
      
      function createSpellFromId(param1:uint, param2:int) : HaxeSpell;
   }
}
