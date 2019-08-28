initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
      // Disable automatic DMA verification
      #10;
      dma_verif_on = 0;

      repeat(5) @(posedge mclk);
      stimulus_done = 0;

      //---------------------------------------
      // Check CPU configuration
      //---------------------------------------
      if ((`PMEM_SIZE !== 24576) || (`DMEM_SIZE !== 16384))
        begin
           $display(" ===============================================");
           $display("|               SIMULATION ERROR                |");
           $display("|                                               |");
           $display("|  Core must be configured for:                 |");
           $display("|               - 24kB program memory           |");
           $display("|               - 16kB data memory              |");
           $display(" ===============================================");
           $finish;        
        end


      //---------------------------------------
      // Generate stimulus
      //---------------------------------------

      repeat(10000) @(posedge mclk);
      stimulus_done = 1;

      $display(" ===============================================");
      $display("|               SIMULATION DONE                 |");
      $display("|       (stopped through verilog stimulus)      |");
      $display(" ===============================================");
      $finish;

   end

